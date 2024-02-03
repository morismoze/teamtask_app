import { Transform } from 'class-transformer';
import { IsEmail, IsNotEmpty } from 'class-validator';
import { ERROR_CODES } from 'src/exception/error-codes';
import { lowerCaseTransformer } from 'src/common/transformers/lower-case.transformer';

export class LoginRequestDto {
  @Transform(lowerCaseTransformer)
  @IsNotEmpty({ message: ERROR_CODES.REQUIRED_FIELD.message })
  @IsEmail({}, { message: ERROR_CODES.INVALID_EMAIL.message })
  email: string;

  @IsNotEmpty({ message: ERROR_CODES.REQUIRED_FIELD.message })
  password: string;
}
