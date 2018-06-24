const RLE = {
  encode(string) {
    if (string === '') { return ''; }

    const segments = string.match(/([a-zA-Z\s])\1*/g);
    const encodedSegments = segments.map((segment) => {
      if (segment.length > 1) {
        return String(segment.length) + segment[0];
      }
      return segment[0];
    });
    return encodedSegments.join('');
  },

  decode(string) {
    if (string === '') { return ''; }

    const segments = string.match(/[A-Za-z\s]|[0-9]+/g);
    const decodedSegments = segments.map((segment, index) => {
      if (segment.match(/[0-9]+/)) {
        return this.times(Number(segment) - 1, segments[index + 1]);
      }
      return segment;
    });
    return decodedSegments.join('');
  },

  times(count, char) {
    let counter = count;
    let sequence = '';
    while (counter > 0) {
      sequence += char;
      counter -= 1;
    }
    return sequence;
  },
};

module.exports = RLE;
