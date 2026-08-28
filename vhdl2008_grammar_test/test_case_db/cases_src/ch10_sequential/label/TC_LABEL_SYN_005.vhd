-- =============================================================
-- Case ID: TC_LABEL_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_LABEL
-- Standard Reference: IEEE 1076-2008 Section 10.1
-- Production: label ::= identifier
-- Case Type: Positive
-- Test Focus: label: identifier on null statement and report statement in same process
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity label_syn5_ent is port(en:in bit; y:out integer); end entity;
architecture bh of label_syn5_ent is
  signal s_done:integer:=0;
begin
  process is
  begin
    wait until en='1';
    IDLE_STATE: null;
    REPORT_STATE: report "Processing" severity note;
    s_done <= 1;
    y <= s_done;
    wait;
  end process;
end architecture bh;
