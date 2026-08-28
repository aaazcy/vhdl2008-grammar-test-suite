-- =============================================================
-- Case ID: TC_PARAMETER_SPECIFICATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_PARAMETER_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 10.10
-- Production: parameter_specification ::= identifier in discrete_range
-- Case Type: Positive
-- Test Focus: enumeration type as discrete_range: `for c in t_color loop` — identifier `c` iterates over all values of the enumeration type
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ps_syn3_ent is port(y:out integer); end entity;
architecture bh of ps_syn3_ent is
  type t_color is (RED, GREEN, BLUE);
begin
  process is
    variable v : integer := 0;
  begin
    for c in t_color loop
      case c is
        when RED   => v := v + 1;
        when GREEN => v := v + 2;
        when BLUE  => v := v + 3;
      end case;
    end loop;
    y <= v;
    wait;
  end process;
end architecture bh;
