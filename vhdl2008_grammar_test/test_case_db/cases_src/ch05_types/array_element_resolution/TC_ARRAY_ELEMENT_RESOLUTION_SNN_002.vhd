-- =============================================================
-- Case ID: TC_ARRAY_ELEMENT_RESOLUTION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARRAY_ELEMENT_RESOLUTION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_element_resolution ::= resolution_indication
-- Case Type: Negative
-- Test Focus: resolution_indication must be a function name.
--            Using a procedure name (a non-function callable)
--            as the resolution_indication is invalid.
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity bad_resolution_not_function is
  port (
    d : out bit
  );
end entity bad_resolution_not_function;

architecture rtl of bad_resolution_not_function is
  procedure do_nothing (x : in bit) is
  begin
  end procedure;
  -- ERROR: "do_nothing" is a procedure, not a resolution function.
  -- A procedure is not a valid resolution_indication.
  subtype bad_el is do_nothing bit;
  signal s : bad_el;
begin
  s <= '0';
  d <= s;
end architecture rtl;
