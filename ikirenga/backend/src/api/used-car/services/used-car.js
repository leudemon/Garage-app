'use strict';

/**
 * used-car service
 */

const { createCoreService } = require('@strapi/strapi').factories;

module.exports = createCoreService('api::used-car.used-car');
