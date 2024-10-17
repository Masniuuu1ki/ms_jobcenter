document.getElementById('close-ui').onclick = function() {
    document.querySelector('.container').style.display = 'none';

    fetch(`https://${GetParentResourceName()}/closeUI`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({})
    });
}

let selectedJob = null;

function updateJobs(jobs) {
    jobs.forEach((job, index) => {
        const jobElement = document.querySelector(`#job${index + 1}`);
        if (jobElement) {
            jobElement.querySelector('h2').innerText = job.title;
            jobElement.querySelector('.salary').innerText = job.salary;
            jobElement.querySelector('p').innerText = job.description;
            jobElement.setAttribute('data-jobName', job.jobName);
        }
    });

    const buttons = document.querySelectorAll('.choose-btn');
    buttons.forEach(button => {
        const clonedButton = button.cloneNode(true);
        button.replaceWith(clonedButton);
    });

    document.querySelectorAll('.choose-btn').forEach(button => {
        button.addEventListener('click', function() {
            const jobElement = this.closest('.job');
            
            selectedJob = {
                jobName: jobElement.getAttribute('data-jobName'),
                title: jobElement.querySelector('h2').innerText,
                salary: jobElement.querySelector('.salary').innerText,
                description: jobElement.querySelector('p').innerText
            };

            console.log("Wybrana praca:", selectedJob);

            fetch(`https://${GetParentResourceName()}/jobSelected`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(selectedJob)
            }).then(response => {
                if (!response.ok) {
                    console.error("Błąd podczas wysyłania pracy:", response.statusText);
                }
            }).catch(error => {
                console.error("Błąd:", error);
            });
        });
    });
}

window.addEventListener('message', function(event) {
    if (event.data.action == "updateJobs") {
        document.querySelector('.container').style.display = 'block';
        updateJobs(event.data.jobs);
    } else if (event.data.action == "close") {
        document.querySelector('.container').style.display = 'none';
    }
});
