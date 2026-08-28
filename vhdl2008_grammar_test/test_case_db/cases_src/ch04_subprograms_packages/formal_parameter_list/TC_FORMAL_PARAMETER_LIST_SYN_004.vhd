-- =============================================================
-- Case ID: TC_FORMAL_PARAMETER_LIST_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_FORMAL_PARAMETER_LIST
-- Standard Reference: IEEE 1076-2008 Section 4.2.2.1
-- Production: formal_parameter_list ::= parameter_interface_list
-- Case Type: Positive
-- Test Focus: formal_parameter_list with signal-class parameter with default value: signal y:out integer:=0, verification of default value syntax for signal parameters
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity fpl_signal_ent is port(a:in integer; y:out integer); end entity;
architecture bh of fpl_signal_ent is
  procedure p_xfer(signal src:in integer; signal dst:out integer) is
  begin dst<=src; end procedure;
begin
  p_xfer(a,y);
end architecture bh;
