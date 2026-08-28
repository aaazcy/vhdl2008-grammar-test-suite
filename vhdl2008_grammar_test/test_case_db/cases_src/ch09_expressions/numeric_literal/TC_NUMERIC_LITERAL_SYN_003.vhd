-- =============================================================
-- Case ID: TC_NUMERIC_LITERAL_SYN_003
-- Rule Type: Syntax
-- BNF Production: numeric_literal
-- IEEE Section: 9.3.3.1
-- BNF Text: numeric_literal ::= abstract_literal | physical_literal
-- Test Focus: physical_literal with time units (ns, us, ms, ps) for a configurable delay timer
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_numeric_literal_syn_003 is
  port (
    trigger  : in  bit;
    delayed  : out bit
  );
end entity tc_numeric_literal_syn_003;

architecture delay_unit of tc_numeric_literal_syn_003 is
  constant DLY_NS : time := 100 ns;    -- physical_literal: nanoseconds
  constant DLY_US : time := 10 us;     -- physical_literal: microseconds
  constant DLY_PS : time := 500 ps;    -- physical_literal: picoseconds
begin
  delayed <= trigger'delayed(DLY_NS);
end architecture delay_unit;
