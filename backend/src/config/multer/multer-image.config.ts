import type { MulterOptions } from '@nestjs/platform-express/multer/interfaces/multer-options.interface';

import { MAX_UPLOAD_BYTES } from '../upload-limits';

const ALLOWED_MIME_TYPES = [
  'image/jpeg',
  'image/png',
  'image/webp',
  'image/gif',
];

export const multerImageConfig: MulterOptions = {
  limits: { fileSize: MAX_UPLOAD_BYTES },

  fileFilter: (
    req: any,
    file: Express.Multer.File,
    cb: (error: Error | null, acceptFile: boolean) => void,
  ): void => {
    if (!ALLOWED_MIME_TYPES.includes(file.mimetype)) {
      req.__uploadRejectDetails = {
        ...(req.__uploadRejectDetails ?? {}),
        [file.fieldname]: ['Invalid image format'],
      };

      return cb(null, false);
    }

    cb(null, true);
  },
};
