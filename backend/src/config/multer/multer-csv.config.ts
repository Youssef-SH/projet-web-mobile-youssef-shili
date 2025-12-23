import type { MulterOptions } from '@nestjs/platform-express/multer/interfaces/multer-options.interface';

import { MAX_UPLOAD_BYTES } from '../upload-limits';

export const multerCsvConfig: MulterOptions = {
  limits: { fileSize: MAX_UPLOAD_BYTES },

  fileFilter: (
    req: any,
    file: Express.Multer.File,
    cb: (error: Error | null, acceptFile: boolean) => void,
  ): void => {
    if (file.mimetype !== 'text/csv') {
      req.__uploadRejectDetails = {
        ...(req.__uploadRejectDetails ?? {}),
        [file.fieldname]: ['Invalid CSV format'],
      };

      return cb(null, false);
    }

    cb(null, true);
  },
};
