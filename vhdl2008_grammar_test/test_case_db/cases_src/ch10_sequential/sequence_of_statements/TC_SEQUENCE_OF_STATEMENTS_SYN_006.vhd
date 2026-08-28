-- =============================================================
-- Case ID: TC_SEQUENCE_OF_STATEMENTS_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_SEQUENCE_OF_STATEMENTS
-- Standard Reference: IEEE 1076-2008 Section 10.1
-- Production: sequence_of_statements ::= { sequential_statement }
-- Case Type: Positive
-- Test Focus: Sequence mixing multiple statement types: signal assign -> variable assign -> if -> case -> null -> signal assign, verifying a seq holds 6 of the 13 sequential_statement subtypes
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sos_syn6_ent is port(sel:in integer range 0 to 2; a:in integer; y:out integer); end entity;
architecture bh of sos_syn6_ent is
  signal s_tmp : integer := 0;
begin
  process(sel,a) is
    variable v_tmp : integer := 0;
  begin
    s_tmp <= a;
    v_tmp := s_tmp;
    if v_tmp > 10 then v_tmp := 10; end if;
    case sel is
      when 0 => v_tmp := v_tmp + 1;
      when 1 => v_tmp := v_tmp * 2;
      when others => null;
    end case;
    y <= v_tmp;
  end process;
end architecture bh;
