-- =============================================================
-- Case ID: TC_NUMERIC_LITERAL_SYN_S01
-- Rule Type: Syntax
-- BNF Production: numeric_literal
-- IEEE Section: 9.3.3.1
-- BNF Text: numeric_literal ::= abstract_literal | physical_literal
-- Test Focus: abstract_literal usage with both integer and real numeric literals in a PID controller
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_numeric_literal_syn_s01 is
  port (
    input_val  : in  integer range 0 to 100;
    error_out  : out integer range -50 to 50
  );
end entity tc_numeric_literal_syn_s01;

architecture pid of tc_numeric_literal_syn_s01 is
  constant SETPOINT : integer := 50;    -- abstract_literal: integer
  constant KP       : real    := 1.5;   -- abstract_literal: real
begin
  error_out <= integer(KP * real(input_val - SETPOINT));
end architecture pid;
