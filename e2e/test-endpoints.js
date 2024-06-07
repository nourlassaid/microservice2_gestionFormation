const { Builder, By, Key, until } = require('selenium-webdriver');

async function testEndpoints() {
    let driver = await new Builder().forBrowser('chrome').build();
    try {
        // Test de récupération de toutes les formations
        await driver.get('http://localhost:3099/api/formations');
        const formations = await driver.findElement(By.tagName('pre')).getText();
        console.log('Formations récupérées:', formations);

        // Test de récupération d'une formation par son ID (remplacez 1 par l'ID de la formation que vous souhaitez tester)
        await driver.get('http://localhost:3099/api/formations/1');
        const formation = await driver.findElement(By.tagName('pre')).getText();
        console.log('Formation récupérée par ID:', formation);

        // Test d'ajout d'une nouvelle formation (remplacez les données par celles que vous souhaitez tester)
        await driver.get('http://localhost:3099/api/formations');
        // Handle NoSuchElementError
        try {
            await driver.findElement(By.name('nom')).sendKeys('Nouvelle formation');
            await driver.findElement(By.name('description')).sendKeys('Description de la nouvelle formation');
            await driver.findElement(By.name('date_debut')).sendKeys('2024-06-07');
            await driver.findElement(By.name('date_fin')).sendKeys('2024-06-10');
            await driver.findElement(By.name('lieu')).sendKeys('Lieu de la nouvelle formation');
            await driver.findElement(By.tagName('form')).submit();
            console.log('Nouvelle formation ajoutée avec succès');
        } catch (error) {
            console.error('Une erreur s\'est produite lors de l\'ajout de la formation:', error);
        }

        // Test de mise à jour d'une formation (remplacez 1 par l'ID de la formation que vous souhaitez mettre à jour)
        await driver.get('http://localhost:3099/api/formations/1');
        // Handle NoSuchElementError
        try {
            await driver.findElement(By.name('nom')).clear();
            await driver.findElement(By.name('nom')).sendKeys('Formation mise à jour');
            await driver.findElement(By.tagName('form')).submit();
            console.log('Formation mise à jour avec succès');
        } catch (error) {
            console.error('Une erreur s\'est produite lors de la mise à jour de la formation:', error);
        }

        // Test de suppression d'une formation (remplacez 1 par l'ID de la formation que vous souhaitez supprimer)
        await driver.get('http://localhost:3099/api/formations/1');
        // Handle NoSuchElementError
        try {
            await driver.findElement(By.tagName('button')).click();
            console.log('Formation supprimée avec succès');
        } catch (error) {
            console.error('Une erreur s\'est produite lors de la suppression de la formation:', error);
        }

        // Ajouter un temps d'attente pour que le titre de la page devienne "Hello, World!"
        await driver.wait(until.titleIs("Hello, World!"), 10000); // 10 secondes de timeout
        console.log("Le titre de la page est devenu 'Hello, World!' avec succès.");
    } catch (error) {
        console.error('Une erreur s\'est produite:', error);
    } finally {
        await driver.quit();
    }
}

testEndpoints();
