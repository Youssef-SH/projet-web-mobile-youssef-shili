import { Entity, PrimaryGeneratedColumn, Column, OneToMany } from 'typeorm';
import { AnnexUpload } from './annex-upload.entity';

@Entity({ name: 'annex_template' })
export class AnnexTemplate {
  @PrimaryGeneratedColumn('uuid')
  id!: string;

  @Column({
    name: 'annex_number',
    type: 'smallint',
    unique: true,
  })
  annexNumber!: number;

  @Column({ type: 'text' })
  title!: string;

  @Column({ name: 'template_key', type: 'text' })
  templateKey!: string;

  @Column({ type: 'boolean', default: true })
  required!: boolean;

  @Column({ name: 'is_archived', type: 'boolean', default: false })
  isArchived!: boolean;

  @OneToMany(() => AnnexUpload, (upload) => upload.template)
  uploads!: AnnexUpload[];
}
