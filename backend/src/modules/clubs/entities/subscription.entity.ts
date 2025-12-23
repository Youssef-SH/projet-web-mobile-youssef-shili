import {
  Entity,
  PrimaryGeneratedColumn,
  ManyToOne,
  Unique,
  CreateDateColumn,
  JoinColumn,
  RelationId,
} from 'typeorm';

import { User } from '../../auth/entities/user.entity';
import { Club } from './club.entity';

@Entity({ name: 'subscription' })
@Unique(['student', 'club'])
export class Subscription {
  @PrimaryGeneratedColumn('uuid')
  id!: string;

  @ManyToOne(() => User, { onDelete: 'RESTRICT' })
  @JoinColumn({ name: 'student_id' })
  student!: User;

  @RelationId((s: Subscription) => s.student)
  studentId!: string;

  @ManyToOne(() => Club, (club) => club.subscriptions, { onDelete: 'RESTRICT' })
  @JoinColumn({ name: 'club_id' })
  club!: Club;

  @RelationId((s: Subscription) => s.club)
  clubId!: string;

  @CreateDateColumn({ name: 'created_at', type: 'timestamptz' })
  createdAt!: Date;
}
