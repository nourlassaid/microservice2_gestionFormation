const { getFormations, getFormationById, addFormation, updateFormation, deleteFormation } = require('../controller');
const db = require('../db');

jest.mock('../db');

describe('Controller Tests', () => {
  const mockRows = [{ id: 1, name: 'Formation 1' }, { id: 2, name: 'Formation 2' }];
  const req = {};
  const res = {
    json: jest.fn()
  };

  test('getFormations - should return all formations', async () => {
    db.query.mockImplementation((query, callback) => {
      callback(null, mockRows);
    });

    await getFormations(req, res);
    expect(res.json).toHaveBeenCalledWith(mockRows);
  });

  // Ajoutez les autres tests ici
});
