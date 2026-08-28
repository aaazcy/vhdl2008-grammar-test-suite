-- =============================================================
-- Case ID: TC_LABEL_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_LABEL
-- Standard Reference: IEEE 1076-2008 Section 10.1
-- Production: label ::= identifier
-- Case Type: Positive
-- Test Focus: label: identifier labelling a for-loop statement with the loop variable controlling iteration
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity label_syn1_ent is port(y:out integer); end entity;
architecture bh of label_syn1_ent is
  signal s_sum:integer:=0;
begin
  process is
  begin
    SUM_LOOP: for i in 0 to 9 loop
      s_sum <= s_sum + i;
    end loop;
    y <= s_sum;
    wait;
  end process;
end architecture bh;
