-- =============================================================
-- Case ID: TC_CASE_STATEMENT_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_CASE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: case_statement ::= [ case_label : ] case expression is case_statement_alternative { case_statement_alternative } end case [ case_label ] ;
-- Case Type: Positive
-- Test Focus: Nested case statements: outer case on integer range selects an operation mode (0/1/2) and each mode branch contains an inner case on a second integer signal to decode sub-operation parameters, verifying that case_statement can nest arbitrarily within another case branch body
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity case_nested_ent is
  port(mode:in integer range 0 to 2; sub_op:in integer range 0 to 3; y:out integer);
end entity;
architecture bh of case_nested_ent is
  signal s_base:integer:=0;
begin
  process(mode, sub_op) is
    variable v_add:integer:=0;
  begin
    case mode is
      when 0 =>
        y<=10;
      when 1 =>
        case sub_op is
          when 0 => v_add:=0;
          when 1 => v_add:=10;
          when 2 => v_add:=20;
          when 3 => v_add:=30;
        end case;
        y<=100+v_add;
      when 2 =>
        case sub_op is
          when 0 => s_base<=0;
          when 1 => s_base<=50;
          when 2 => s_base<=100;
          when 3 => s_base<=150;
        end case;
        y<=200+s_base;
    end case;
  end process;
end architecture bh;
