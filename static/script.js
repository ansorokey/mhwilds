console.log('Hello world');

async function fetchMonsterPage1(id) {
    const res = await fetch(`/monsters/${+id}`, {
        method: 'GET'
    });
    
    if (res.ok) {
        const data = await res.json();
        return data;
    }
}

async function writeGuide(id, page) {
    const data = await fetchMonsterPage1(id);
    const guideDetails = document.querySelector('#guide-details');
    guideDetails.innerHTML = `<h2>${data.html}</h2>`;

    switch(page) {
        case 1:
            const page1SwitchBtn = document.querySelector('#page-1-switch-btn');
            page1SwitchBtn.addEventListener('click', () => {
                document.querySelector('#page1-switch-a').classList.toggle('hidden');
                document.querySelector('#page1-switch-b').classList.toggle('hidden');
                page1SwitchBtn.dataset.showa = page1SwitchBtn.dataset.showa ? "False" : "True"
            });

            document.querySelector('#book-title').innerText = "Monster Ecology";
            break;
        
        case 2:
            document.querySelector('#book-title').innerText = "Suggested Strategy";
            break;

        case 3:
            document.querySelector('#book-title').innerText = "Detailed Strategy";
            break;

        case 4:
            document.querySelector('#book-title').innerText = "Obtainable Materials";
            break;

        case 5:
            document.querySelector('#book-title').innerText = "Hunting Log";
            break;        
        }
}

window.addEventListener('DOMContentLoaded', () => {
    const allMonsterTiles = document.querySelectorAll('.monster-listing');
    
    allMonsterTiles.forEach(tile => 
        tile.addEventListener('click', () => writeGuide(tile.dataset.monsterid, 1))
    )

    writeGuide(1, 1);
})