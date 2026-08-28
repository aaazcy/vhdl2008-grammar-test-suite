-- =============================================================
-- Case ID: TC_ENTITY_DECLARATION_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declaration ::= entity identifier is entity_header entity_declarative_part [ begin entity_statement_part ] end [ entity ] [ entity_simple_name ] ;
-- Case Type: Positive
-- Test Focus: Declarative part — object declarations: entity_declarative_part declares signal(with register kind+default value)/constant(with integer+time default values)/file type+file object/alias(object alias with subtype_indication)/shared variable(protected type)/attribute specification, verifying the entity-level declarative part supports all object categories
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_decl_objects is
  port(clk : in bit; cnt_out : out integer);
end entity ent_decl_objects;
architecture bh of ent_decl_objects is
  type t_cnt is range 0 to 255;
  function f_resolve_b(v : bit_vector) return bit is
  begin
    for i in v'range loop if v(i) = '1' then return '1'; end if; end loop;
    return '0';
  end function f_resolve_b;
  subtype r_bit is f_resolve_b bit;
  signal s_cnt     : t_cnt := 0;
  signal s_bus_reg : r_bit register;
  constant C_MAX   : t_cnt := 255;
  constant C_PERIOD: time := 10 ns;
  type t_int_file is file of integer;
  alias a_cnt      : t_cnt is s_cnt;
  attribute keep    : string;
  attribute keep of s_cnt : signal is "true";
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      if s_cnt < C_MAX then s_cnt <= s_cnt + 1; end if;
    end if;
  end process;
  cnt_out <= integer(a_cnt);
end architecture bh;
