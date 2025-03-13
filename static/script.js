console.log('Hello world');

async function testFetch() {
    const res = await fetch('/monsters/1', {
        method: 'GET'
    });
    
    if (res.ok) {
        const json = await res.json();
        console.log(json);
    }
}

async function fetchMonsterPage1(id) {
    const res = await fetch(`/monsters/${+id}`, {
        method: 'GET'
    });
    
    if (res.ok) {
        const data = await res.json();
        return data;
    }
}

testFetch();

window.addEventListener('DOMContentLoaded', () => {
    const allMonsterTiles = document.querySelectorAll('.monster-listing');
    console.log(allMonsterTiles);
    
    allMonsterTiles.forEach(tile => 
        tile.addEventListener('click', async () => {
            const data = await fetchMonsterPage1(tile.dataset.monsterid);
            console.log(data);

            const guideDetails = document.querySelector('#guide-details');
            guideDetails.innerHTML = `<h2>${data.html}</h2>`
            
        })
    )
})