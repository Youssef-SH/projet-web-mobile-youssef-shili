import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  ManyToOne,
  Unique,
  JoinColumn,
  RelationId,
} from 'typeorm';
import { Club } from './club.entity';
import { ClubRole } from '../../../common/enums/club-role.enum';
import { StudyLevel } from '../../../common/enums/study-level.enum';

@Entity({ name: 'club_leader' })
@Unique(['club', 'role'])
export class ClubLeader {
  @PrimaryGeneratedColumn('uuid')
  id!: string;

  @ManyToOne(() => Club, (club) => club.leaders, { onDelete: 'RESTRICT' })
  @JoinColumn({ name: 'club_id' })
  club!: Club;

  @RelationId((l: ClubLeader) => l.club)
  clubId!: string;

  @Column({
    type: 'enum',
    enum: ClubRole,
    enumName: 'club_role',
  })
  role!: ClubRole;

  @Column({ name: 'full_name', type: 'text' })
  fullName!: string;

  @Column({ type: 'varchar', length: 8 })
  cin!: string;

  @Column({ type: 'varchar', length: 8 })
  phone!: string;

  @Column({ type: 'text' })
  email!: string;

  @Column({
    name: 'study_level',
    type: 'enum',
    enum: StudyLevel,
    enumName: 'study_level',
  })
  studyLevel!: StudyLevel;

  @Column({ type: 'text' })
  specialization!: string;
}
