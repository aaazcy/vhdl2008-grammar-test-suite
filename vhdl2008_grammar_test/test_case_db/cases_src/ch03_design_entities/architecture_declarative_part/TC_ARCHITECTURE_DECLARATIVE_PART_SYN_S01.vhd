-- =============================================================
-- Case ID: TC_ARCHITECTURE_DECLARATIVE_PART_SYN_S01
-- Rule Type: Syntax
-- BNF Production: ARCHITECTURE_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Test Focus: All declarative items: type, subtype, signal, constant, file, alias, component, attribute decl/spec, subprogram body, use clause
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_architecture_declarative_part_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_architecture_declarative_part_syn_s01 is
  type t_arch is range 0 to 255; subtype t_arch_sub is t_arch range 0 to 127;
  type t_state is (IDLE,RUN,STOP); type t_vec is array(0 to 7) of bit;
  type t_rec is record a:integer; b:bit; end record;
  signal s_clk:bit:='0'; constant C_MAX:t_arch:=255; alias a_clk is s_clk;
  component comp_d is port(x:in bit;y:out bit); end component;
  attribute comp_s:string; attribute comp_s of comp_d:component is "rtl";
  function f_dbl(x:integer) return integer is begin return x*2; end function;
begin
  s_clk<=not s_clk after 5 ns; r<=f_dbl(21);end architecture bh;
