function go(url)
{
    window.location = url;
}

function deleteClientInfo(url)
{
    var isOK = confirm("Are you sure to delete?");
    if(isOK)
    {
        go(url);
    }
}