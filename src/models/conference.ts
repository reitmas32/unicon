// Model representing a conference talk
export type ConferenceModel = {
  // Start time of the talk
  start: string;

  // End time of the talk
  end: string;

  // Title of the talk
  title: string;

  // Description summarizing the talk
  description: string;

  name_speaker: string;

  img_speaker: string;

  tags: string[];
}
