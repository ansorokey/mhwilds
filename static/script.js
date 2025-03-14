console.log('Hello world');

let curId = 1;
let curPage = 1;

async function fetchMonster(id, page) {
    const res = await fetch(`/monsters/${+id}/${+page}`, {
        method: 'GET'
    });
    
    if (res.ok) {
        const data = await res.json();
        console.log(data);
        return data;
    }
}

async function writeGuide(id, page) {
    const data = await fetchMonster(id, page);
    const pageContent = document.querySelector('#page-content');
    pageContent.innerHTML = `${data.html}`;

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
            const page2SwitchBtn = document.querySelector('#page-2-switch-btn');
            page2SwitchBtn.addEventListener('click', () => {
                document.querySelector('#page2-switch-a').classList.toggle('hidden');
                document.querySelector('#page2-switch-b').classList.toggle('hidden');
                page2SwitchBtn.dataset.showa = page2SwitchBtn.dataset.showa ? "False" : "True"
            });

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

// When all static html has loaded
window.addEventListener('DOMContentLoaded', () => {
    const allMonsterTiles = document.querySelectorAll('.monster-listing');
    allMonsterTiles.forEach(tile => {        
        tile.addEventListener('click', () => {
            writeGuide(+tile.dataset.monsterid, +curPage)
            curId = +tile.dataset.monsterid
        })
    })

    const allPageButtons = document.querySelectorAll('.pg-btn');
    allPageButtons.forEach(btn => {
        btn.addEventListener('click', () =>{
            if(btn.dataset.page === 'Next') {
                if(curPage == 5) {
                    curPage = 1;
                } else {
                    curPage += 1;
                }
                writeGuide(+curId, curPage)
            } else if(btn.dataset.page === 'Prev'){
                if(curPage == 1) {                    
                    curPage = 5;
                } else {                    
                    curPage -= 1;
                }
                writeGuide(+curId, curPage)
            } else {
                curPage = +btn.dataset.page;
                writeGuide(+curId, curPage)
            }
            console.log(curId, curPage);
        })
    })

    // Load the first page of the first entry
    writeGuide(1, 1);
})