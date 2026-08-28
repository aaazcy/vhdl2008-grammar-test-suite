-- =============================================================
-- Case ID: TC_PROCEDURE_SPECIFICATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCEDURE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 4.2.1
-- Production: procedure_specification ::= procedure designator [ ( formal_parameter_list ) ]
-- Case Type: Positive
-- Test Focus: procedure specification with all three interface classes (constant, signal, variable) exercising formal_parameter_list across in, out, and inout parameter modes
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ps_ent is port(clk:in bit; a:in integer; y:out integer); end entity;
architecture bh of ps_ent is
  procedure p_transfer(
    constant c_in  : in  integer;
    signal   s_out : out integer;
    variable v_tmp : inout integer) is
  begin s_out<=c_in+v_tmp; v_tmp:=v_tmp+1; end procedure;
  signal s_result:integer:=0;
begin
  process(clk)
    variable v_acc:integer:=0;
  begin
    if clk'event and clk='1' then
      p_transfer(a,s_result,v_acc);
    end if;
  end process;
  y<=s_result;
end architecture bh;
