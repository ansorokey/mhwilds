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

testFetch();