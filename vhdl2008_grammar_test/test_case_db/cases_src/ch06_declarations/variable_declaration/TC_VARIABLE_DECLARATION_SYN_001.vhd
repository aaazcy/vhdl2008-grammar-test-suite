-- =============================================================
-- Case ID: TC_VARIABLE_DECLARATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_VARIABLE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5
-- Production: variable_declaration ::= [ shared ] variable identifier { , identifier } : subtype_indication [ := expression ] ;
-- Case Type: Positive
-- Test Focus: Variable + shared variable: ordinary variable(inside a process, with default value) / shared variable(in the architecture declarative region, integer type, with default value 0) / multi-identifier variable(a,b:integer), verifying the shared keyword and default expression of variable
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity var_ent is port(clk:in bit; y:out integer); end entity;
architecture bh of var_ent is
  type pt_int is protected
    procedure set_val(v:integer);
    impure function get_val return integer;
  end protected pt_int;
  type pt_int is protected body
    variable m_val:integer:=0;
    procedure set_val(v:integer) is begin m_val:=v; end procedure;
    impure function get_val return integer is begin return m_val; end function;
  end protected body pt_int;
  shared variable sv_cnt:pt_int;
  signal s_res:integer:=0;
begin
  process(clk)
    variable v_tmp,v_acc:integer:=0;
  begin
    if clk'event and clk='1' then
      v_tmp:=v_tmp+1; v_acc:=v_acc+v_tmp; sv_cnt.set_val(v_acc);
    end if;
    s_res<=sv_cnt.get_val;
  end process;
  y<=s_res;
end architecture bh;
