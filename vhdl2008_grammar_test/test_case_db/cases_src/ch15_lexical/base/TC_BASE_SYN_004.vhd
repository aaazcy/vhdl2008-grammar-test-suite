-- =============================================================
-- Case ID: TC_BASE_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASE
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: base ::= integer
-- Case Type: Positive
-- Test Focus: base used consecutively in based_literals of multiple different radices(8#377#, 10#255#, 12#1A3#) verify the legality of multiple different base values in the same design unit
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bs_multi_base_context is
  port (
    oct_val : out integer;
    dec_val : out integer;
    duo_val : out integer
  );
end entity bs_multi_base_context;

architecture rtl of bs_multi_base_context is
  constant C_OCT : integer := 8#377#;
  constant C_DEC : integer := 10#255#;
  constant C_DUO : integer := 12#1A3#;
begin
  oct_val <= C_OCT;
  dec_val <= C_DEC;
  duo_val <= C_DUO;
end architecture rtl;
