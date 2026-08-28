-- =============================================================
-- Case ID: TC_ARCHITECTURE_BODY_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_BODY
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_body ::= architecture identifier of entity_name is architecture_declarative_part begin architecture_statement_part end [ architecture ] [ architecture_simple_name ] ;
-- Case Type: Positive
-- Test Focus: types: custom integer/enum/array/record, subtypes, constants, aliases
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity arch_decl_ent is
  port(clk:in bit; data:in bit_vector(7 downto 0); result:out integer);
end entity;
architecture rtl of arch_decl_ent is
  type t_uint8 is range 0 to 255;
  type t_state is (IDLE,READ,WRITE,ERROR_STATE);
  type t_packet is record header:bit_vector(7 downto 0); payload:bit_vector(31 downto 0); crc:bit_vector(7 downto 0); end record;
  subtype t_nibble is integer range 0 to 15;
  subtype t_byte is bit_vector(7 downto 0);
  constant C_MAX:t_uint8:=255;
  constant C_TO:time:=100 ns;
  signal s_state:t_state:=IDLE;
  signal s_pkt:t_packet;
  signal s_cnt:t_uint8:=0;
  signal s_data:t_byte:=(others=>'0');
  alias a_hdr:bit_vector(7 downto 0) is s_pkt.header;
begin
  s_data<=data; result<=integer(s_cnt);
  process(clk)
  begin
    if clk'event and clk='1' then
      case s_state is
        when IDLE=>s_state<=READ;
        when READ=>s_pkt.header<=data; s_state<=WRITE;
        when WRITE=>s_cnt<=s_cnt+1; s_state<=IDLE;
        when ERROR_STATE=>s_state<=IDLE;
      end case;
    end if;
  end process;
end architecture rtl;
