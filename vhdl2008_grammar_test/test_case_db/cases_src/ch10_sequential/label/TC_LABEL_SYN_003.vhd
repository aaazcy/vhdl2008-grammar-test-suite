-- =============================================================
-- Case ID: TC_LABEL_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_LABEL
-- Standard Reference: IEEE 1076-2008 Section 10.1
-- Production: label ::= identifier
-- Case Type: Positive
-- Test Focus: label: identifier on assertion statement for error checking
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity label_syn3_ent is port(val:in integer; y:out integer); end entity;
architecture bh of label_syn3_ent is
begin
  process(val) is
  begin
    RANGE_CHECK: assert val>=0 and val<256
      report "Value out of range"
      severity warning;
    if val>=0 and val<256 then y<=val; else y<=0; end if;
  end process;
end architecture bh;
