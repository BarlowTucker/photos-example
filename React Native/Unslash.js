export const loadImageList = () => {
    return fetch('https://api.unsplash.com/photos/', {
        method: 'GET',
        headers: {
            'Authorization': 'Client-ID [ADD YOUR UNSPLASH TOKEN HERE]'
        }
    }).then((response) => response.json())
}