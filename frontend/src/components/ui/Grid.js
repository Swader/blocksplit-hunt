import React, { Component } from 'react';

import Tile from '../containers/Tile';

const size = Array.apply(null, Array(6))

class Grid extends Component {
  constructor(props) {
    super(props);
    this.state = { flipped: false }
    this.flip = this.flip.bind(this);
  }

  flip() {
    if (this.props.solved) this.setState({flipped: !this.state.flipped})
  }

  render() {
    const solved = this.props.solved ? 'solved' : '';
    const flipped = this.state.flipped ? 'flipped' : '';
    return (
      <div className={`grid ${solved} ${flipped}`}>
        <div className="grid-inner" onClick={this.flip}>
          <div className="grid-front">
            {size.map((n, i) => <Tile key={i} number={i}/>)}
          </div>
          <div className="grid-back">
            <div className="full-width">
              <h3>Access Token</h3>
              <h5>Good for 2 persons</h5>
              <p>
                <span>The Garden Brewery</span>
                <br />
                <span>Zrinski Castle</span>
                <br />
                <span>Čakovec, in the center of the town park</span>
              </p>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default Grid;
