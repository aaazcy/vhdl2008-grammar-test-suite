-- =============================================================
-- Case ID: TC_FORCE_MODE_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_FORCE_MODE
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: force_mode ::= in | out
-- Case Type: Positive
-- Test Focus: `out` used in simple force assignment -- tests basic `force out` on an output port in a process
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity fmode_syn_002 is
  port (
    o_data : out integer
  );
end entity fmode_syn_002;

architecture test of fmode_syn_002 is
begin
  process is
  begin
    o_data <= force out 42;
    wait for 10 ns;
    o_data <= release out;
    wait;
  end process;
end architecture test;
