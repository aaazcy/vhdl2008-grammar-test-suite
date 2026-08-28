-- =============================================================
-- Case ID: TC_PREFIX_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_PREFIX
-- Standard Reference: IEEE 1076-2008 Section 8.3
-- Production: prefix ::= name | function_call
-- Case Type: Negative
-- Test Focus: Invalid prefix — procedure_call used as prefix; only function_call (not procedure_call) is valid as prefix since procedure does not return a value
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity prefix_snn2_ent is port(r:out integer); end entity;
architecture bh of prefix_snn2_ent is
  procedure p_store(signal x:out integer; v:integer) is
  begin x <= v; end procedure;
  signal s : integer := 0;
  signal arr : bit_vector(7 downto 0) := X"00";
begin
  p_store(s, 5);
  r <= p_store(s, 5)(0);  -- ERROR: procedure_call cannot be used as prefix
end architecture bh;
