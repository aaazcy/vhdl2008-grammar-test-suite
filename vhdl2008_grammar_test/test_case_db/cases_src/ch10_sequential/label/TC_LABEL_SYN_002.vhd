-- =============================================================
-- Case ID: TC_LABEL_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_LABEL
-- Standard Reference: IEEE 1076-2008 Section 10.1
-- Production: label ::= identifier
-- Case Type: Positive
-- Test Focus: label: identifier on while-loop with exit statement referencing the label for early termination
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity label_syn2_ent is port(start:in bit; y:out integer); end entity;
architecture bh of label_syn2_ent is
  signal s_result:integer:=0;
begin
  process is
    variable v_cnt:integer:=0;
  begin
    wait until start='1';
    COUNT_LOOP: while v_cnt<255 loop
      v_cnt := v_cnt + 1;
      exit COUNT_LOOP when v_cnt=100;
    end loop;
    s_result <= v_cnt;
    y <= s_result;
    wait;
  end process;
end architecture bh;
