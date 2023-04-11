'use strict';

/**
 * mechanic service
 */

const { createCoreService } = require('@strapi/strapi').factories;

module.exports = createCoreService('api::mechanic.mechanic');
