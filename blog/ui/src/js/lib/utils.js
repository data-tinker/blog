export function makeGetRequest(project, tags) {
    var getReuest = '';
    tags.forEach(function (tag,index) {
        var tagValue = $(`#select-${tag}`).val();
        if (tagValue) getReuest += `${tag}=${tagValue}&`;
    });
    if (getReuest) getReuest = getReuest.slice(0, -1);
    window.location.href = `blog?${encodeURIComponent(getReuest)}`;
}
