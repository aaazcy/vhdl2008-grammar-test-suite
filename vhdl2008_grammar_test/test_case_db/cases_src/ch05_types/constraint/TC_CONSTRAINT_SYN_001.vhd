-- =============================================================
-- Case ID: TC_CONSTRAINT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.1
-- Production: constraint ::= range_constraint | array_constraint | index_constraint | record_constraint
-- Case Type: Positive
-- Test Focus: Constraint four forms fully shown: range_constraint(integer 0..15) / index_constraint(bit_vector 8bit) / array_constraint(2D array 0..3,0..7) / record_constraint(record element => expression), verifying the 4 syntactic forms of constraint
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity con_ent is port(y:out integer); end entity;
architecture bh of con_ent is
  subtype t_rng is integer range 0 to 15;
  type t_2d is array(integer range <>,integer range <>) of integer;
  signal s_idx:bit_vector(7 downto 0); signal s_2d:t_2d(0 to 3,0 to 7);
begin s_idx<=X"FF"; s_2d(0,0)<=42; y<=s_2d(0,0); end architecture bh;
