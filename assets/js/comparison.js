window.CCComparison={render(){const ids=CCStore.get('compareColleges',[]);const list=CCColleges.list().filter(c=>ids.includes(c.id));return list;}};
