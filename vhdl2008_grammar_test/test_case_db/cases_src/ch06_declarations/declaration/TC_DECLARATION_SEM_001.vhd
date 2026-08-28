-- =============================================================
-- Case ID: TC_DECLARATION_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.1
-- Production: declaration ::= type_declaration | subtype_declaration | object_declaration | interface_declaration | alias_declaration | attribute_declaration | component_declaration | group_template_declaration | group_declaration | ...
-- Case Type: Positive
-- Test Focus: Semantic validation of declarations in proper scope order: type first, then subtype referencing it, then object using the subtype.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity declaration_sem1 is
  port (
    clk   : in  bit;
    addr  : in  integer range 0 to 255;
    value : out integer range 0 to 65535
  );
end entity declaration_sem1;

architecture rtl of declaration_sem1 is
  type t_addr_range is range 0 to 255;
  subtype t_byte_addr is t_addr_range range 0 to 127;
  constant C_SCALE : integer := 256;
  signal s_addr : t_byte_addr := 0;
  signal s_result : integer range 0 to 65535 := 0;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      s_addr <= t_byte_addr(addr mod 128);
      s_result <= integer(s_addr) * C_SCALE;
      value <= s_result;
    end if;
  end process;
end architecture rtl;
