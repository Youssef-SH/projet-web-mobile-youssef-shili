import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  CreateDateColumn,
} from 'typeorm';
import { InviteType } from './enums/invite-type.enum';
import { InviteStatus } from './enums/invite-status.enum';

@Entity('user_invite')
export class UserInvite {
  @PrimaryGeneratedColumn('uuid')
  id!: string;

  @Column({ type: 'text' })
  email!: string;

  @Column({ type: 'enum', enum: InviteType, enumName: 'invite_type' })
  type!: InviteType;

  @Column({ type: 'text', name: 'token_hash', unique: true })
  tokenHash!: string;

  @Column({
    type: 'enum',
    enum: InviteStatus,
    enumName: 'invite_status',
    default: InviteStatus.PENDING,
  })
  status!: InviteStatus;

  @Column({ type: 'timestamptz', name: 'expires_at' })
  expiresAt!: Date;

  @CreateDateColumn({ type: 'timestamptz', name: 'created_at' })
  createdAt!: Date;
}
