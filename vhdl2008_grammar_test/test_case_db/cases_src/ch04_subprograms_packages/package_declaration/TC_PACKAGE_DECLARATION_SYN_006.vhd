-- =============================================================
-- Case ID: TC_PACKAGE_DECLARATION_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_declaration ::= package identifier is package_header package_declarative_part end [ package ] [ package_simple_name ] ;
-- Case Type: Positive
-- Test Focus: package_declaration with seven declaration items subprogram declaration(procedure+function) + type + subtype + constant + signal + alias, verification of the densest legal combination of package_declarative_part
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package pkg_dense is
  type t_addr is range 0 to 1023;
  subtype t_word is bit_vector(7 downto 0);
  constant C_RESET:t_addr:=0;
  signal s_init:boolean:=true;
  alias a_addr is s_init;
  procedure p_inc(signal v:inout t_addr);
  function f_parity(d:t_word) return bit;
end package pkg_dense;
package body pkg_dense is
  procedure p_inc(signal v:inout t_addr) is begin v<=v+1; end procedure;
  function f_parity(d:t_word) return bit is
    variable p:bit:='0';
  begin
    for i in d'range loop p:=p xor d(i); end loop;
    return p;
  end function;
end package body pkg_dense;
use work.pkg_dense.all;
entity pd_dense_ent is port(addr:out integer; par:out bit); end entity;
architecture bh of pd_dense_ent is
  signal s_addr:t_addr:=work.pkg_dense.C_RESET;
  signal s_word:t_word:="10101010";
begin
  work.pkg_dense.p_inc(s_addr);
  addr<=integer(s_addr);
  par<=work.pkg_dense.f_parity(s_word);
end architecture bh;
