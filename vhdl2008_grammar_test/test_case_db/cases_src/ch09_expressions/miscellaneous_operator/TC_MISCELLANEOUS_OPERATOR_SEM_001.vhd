-- =============================================================
-- Case ID: TC_MISCELLANEOUS_OPERATOR_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_MISCELLANEOUS_OPERATOR_TYPES
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: miscellaneous_operator ::= ** | abs | not
-- Case Type: Positive
-- Rule Description: abs is predefined for any numeric type. not is predefined for BIT, BOOLEAN, and 1D arrays thereof. ** is predefined for integer exponent on any numeric base type; for real base with integer exponent.
-- Test Focus: semantic correctness of the three miscellaneous_operator operations on their respective legal types — abs on integer/real, not on bit/boolean/bit_vector, ** on integer**integer and real**integer, verifying the VHDL predefined unary operator type rules
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_sem_types is
  port (
    ia_i    : in  integer range -128 to 127;
    ra_i    : in  real range -10.0 to 10.0;
    ba_i    : in  bit;
    boola_i : in  boolean;
    bva_i   : in  bit_vector(7 downto 0);
    exp_i   : in  integer range 0 to 4;
    io_o    : out integer;
    ro_o    : out real;
    bo_o    : out bit;
    boolo_o : out boolean;
    bvo_o   : out bit_vector(7 downto 0);
    pow_o   : out integer range 0 to 256
  );
end entity ent_sem_types;

architecture rtl of ent_sem_types is
begin
  io_o    <= abs ia_i;
  ro_o    <= abs ra_i;
  bo_o    <= not ba_i;
  boolo_o <= not boola_i;
  bvo_o   <= not bva_i;
  pow_o   <= 2 ** exp_i;
end architecture rtl;
