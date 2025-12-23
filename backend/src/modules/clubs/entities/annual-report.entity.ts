import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  CreateDateColumn,
  ManyToOne,
  JoinColumn,
  RelationId,
} from 'typeorm';
import { Club } from './club.entity';

@Entity({ name: 'annual_report' })
export class AnnualReport {
  @PrimaryGeneratedColumn('uuid')
  id!: string;

  @ManyToOne(() => Club, (club) => club.reports, {
    onDelete: 'RESTRICT',
    nullable: true,
  })
  @JoinColumn({ name: 'club_id' })
  club!: Club | null;

  @RelationId((r: AnnualReport) => r.club)
  clubId!: string | null;

  @Column({ type: 'int' })
  year!: number;

  @CreateDateColumn({ name: 'generated_at', type: 'timestamptz' })
  generatedAt!: Date;

  @Column({ name: 'report_key', type: 'text' })
  reportKey!: string;
}
