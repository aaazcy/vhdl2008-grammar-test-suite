-- =============================================================
-- Case ID: TC_SEQUENTIAL_STATEMENT_SYN_010
-- Rule Type: Syntax
-- Related Rule ID: BNF_SEQUENTIAL_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.1
-- Production: sequential_statement ::= wait_statement | ... | null_statement
-- Case Type: Positive
-- Test Focus: 7 kinds of sequential_statement in one process: signal assign + var assign + if + case + loop + null + report, verifying the multi-type mix is a valid sequential_statement list
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sqs_syn10_ent is port(sel:in integer range 0 to 2; a,b:in integer; y:out integer); end entity;
architecture bh of sqs_syn10_ent is
  signal s_tmp : integer := 0;
begin
  process(sel,a,b) is
    variable v : integer := 0;
  begin
    s_tmp <= a;
    v := b;
    if v > 100 then v := 100; end if;
    case sel is
      when 0 => null;
      when 1 => v := v + s_tmp;
      when 2 => null;
    end case;
    for i in 0 to 3 loop
      exit when v < 0;
      v := v - 1;
    end loop;
    report "compute done" severity note;
    y <= v;
  end process;
end architecture bh;
