-- =============================================================
-- Case ID: TC_TYPE_DEFINITION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 6.2
-- Production: type_definition ::= scalar_type_definition | composite_type_definition | access_type_definition | file_type_definition | protected_type_definition
-- Case Type: Positive
-- Test Focus: Type definition all 5 kinds: scalar(integer 0..255) / composite(array+record) / access(pointing to record) / file(of integer) / protected(with method declarations+body), verifying all 5 type definition forms of type_definition
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity td_ent is port(clk:in bit; y:out integer); end entity;
architecture bh of td_ent is
  type t_int is range 0 to 255;
  type t_arr is array(0 to 7) of integer;
  type t_rec is record x:integer; y:bit; end record;
  type t_ptr is access t_rec;
  type t_file is file of integer;
  type t_prot is protected procedure inc; impure function val return integer; end protected;
  type t_prot is protected body variable v:integer:=0; procedure inc is begin v:=v+1; end; impure function val return integer is begin return v; end; end protected body;
  shared variable sv:t_prot; signal s_i:t_int:=0;
begin process(clk) begin if clk'event and clk='1' then sv.inc; s_i<=t_int(sv.val); end if; end process; y<=integer(s_i); end architecture bh;
