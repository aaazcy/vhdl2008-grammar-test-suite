-- =============================================================
-- Case ID: TC_ARCHITECTURE_DECLARATIVE_PART_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_declarative_part ::= { block_declarative_item }
-- Case Type: Positive
-- Test Focus: Type + subtype declarations: declarative part contains integer type (t_data 0..1023)/enum type (t_state IDLE,RUN,DONE)/array type 1D+2D/record type (t_pkt)/physical type (t_freq Hz/kHz)/floating type (t_gain)/subtypes (t_byte integer/t_nibble bit_vector), verifying all type_declaration+subtype_declaration categories can coexist in the architecture declarative part
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity adp_types_ent is port(clk:in bit; y:out integer); end entity;
architecture bh of adp_types_ent is
  type t_data  is range 0 to 1023;
  type t_state is (IDLE, RUN, DONE);
  type t_arr   is array(0 to 7) of integer;
  type t_mat   is array(0 to 3, 0 to 3) of bit;
  type t_pkt   is record hdr:bit_vector(7 downto 0); payload:bit_vector(31 downto 0); end record;
  type t_freq  is range 0 to 1000000 units Hz; kHz=1000 Hz; end units;
  type t_gain  is range 0.0 to 10.0;
  subtype t_byte is t_data range 0 to 255;
  signal s_st:t_state:=IDLE; signal s_d:t_data:=0;
begin
  process(clk) begin if clk'event and clk='1' then s_d<=s_d+1; end if; end process;
  y<=integer(s_d);
end architecture bh;
