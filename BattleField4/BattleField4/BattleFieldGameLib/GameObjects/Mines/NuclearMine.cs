﻿namespace BattleFieldGameLib.GameObjects.Mines
{
    using System;
    using BattleFieldGameLib.Enums;

    /// <summary>
    /// A mine class. Inherits base class Mine. Using factory pattern for creating the mines.
    /// </summary>
    public class NuclearMine : Mine
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="NuclearMine" /> class.
        /// </summary>
        public NuclearMine()
        {
            this.CreateMine();
            this.Power = MinePower.Four;
        }

        /// <summary>
        /// Sets the mine body.
        /// </summary>
        public override void CreateMine()
        {
            this.MineBody = new int[,]
            {
                { 0, 1, 1, 1, 0 },
                { 1, 1, 1, 1, 1 },
                { 1, 1, 1, 1, 1 },
                { 1, 1, 1, 1, 1 },
                { 0, 1, 1, 1, 0 }
            };
        }
    }
}
