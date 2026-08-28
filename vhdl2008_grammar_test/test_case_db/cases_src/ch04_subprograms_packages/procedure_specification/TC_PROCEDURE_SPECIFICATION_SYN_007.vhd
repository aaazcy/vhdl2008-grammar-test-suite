-- =============================================================
-- Case ID: TC_PROCEDURE_SPECIFICATION_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCEDURE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 4.2.1
-- Production: procedure_specification ::= procedure designator [ ( formal_parameter_list ) ]
-- Case Type: Positive
-- Test Focus: procedure specification as a deferred subprogram declaration in a package header with formal_parameter_list, body provided separately in package body
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package ps_deferred_pkg is
  procedure p_fetch(addr: in natural; signal data: out integer);
  procedure p_store(addr: in natural; constant val: in integer);
end package;
package body ps_deferred_pkg is
  procedure p_fetch(addr: in natural; signal data: out integer) is
  begin
    data <= addr * 2;
  end procedure;
  procedure p_store(addr: in natural; constant val: in integer) is
  begin
    null;
  end procedure;
end package body;
