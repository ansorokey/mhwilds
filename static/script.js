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

    if(page === 1) {
        const page1SwitchBtn = document.querySelector('#page-1-switch-btn');

        page1SwitchBtn.addEventListener('click', () => {
            document.querySelector('#page1-switch-a').classList.toggle('hidden');
            document.querySelector('#page1-switch-b').classList.toggle('hidden');
            page1SwitchBtn.dataset.showa = page1SwitchBtn.dataset.showa ? "False" : "True"
        })
    }
}

window.addEventListener('DOMContentLoaded', () => {
    const allMonsterTiles = document.querySelectorAll('.monster-listing');
    
    allMonsterTiles.forEach(tile => 
        tile.addEventListener('click', () => writeGuide(tile.dataset.monsterid, 1))
    )

    writeGuide(1, 1);
})