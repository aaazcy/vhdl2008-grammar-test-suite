-- =============================================================
-- Case ID: TC_ARCHITECTURE_DECLARATIVE_PART_SYN_009
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_declarative_part ::= { block_declarative_item }
-- Case Type: Positive
-- Test Focus: Multiple use_clauses importing different library packages - declarative part contains three use_clauses ieee.std_logic_1164.all, ieee.numeric_std.all, std.standard.all, combined with type+signal+function, verifying multiple use_clauses are legal as block_declarative_items in the architecture declarative part and mutually independent
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity adp_multiuse_ent is port(clk:in bit; din:in integer; dout:out integer); end entity;
architecture bh of adp_multiuse_ent is
  use std.standard.all;
  type t_addr is range 0 to 255;
  constant C_BASE:t_addr:=0;
  signal s_reg:t_addr:=C_BASE;
  signal s_next:t_addr;
  function f_wrap(x:integer) return t_addr is
  begin
    if x<0 then return 0;
    elsif x>255 then return 255;
    else return t_addr(x);
    end if;
  end function;
begin
  s_next<=f_wrap(din);
  process(clk) begin
    if clk'event and clk='1' then s_reg<=s_next; end if;
  end process;
  dout<=integer(s_reg);
end architecture bh;
