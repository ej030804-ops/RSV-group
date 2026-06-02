

// import React from 'react';
// import { Facebook, Twitter, Instagram, Youtube } from 'lucide-react';
// import logo from '../images/LOGO.png';

// const Footer = ({ onNavigate }) => {
//   return (
//     <footer className="footer" id="footer">
//       <div className="container footer-content">
//         <div className="footer-brand">
//           <div className="logo-section" style={{ marginBottom: '1.5rem', cursor: 'pointer', maxWidth: '140px' }} onClick={() => onNavigate('home')}>
//             <img src={logo} alt="RSV Groups Logo" style={{ width: '100%', height: 'auto' }} />
//           </div>
//           <p className="brand-desc" style={{ color: 'rgba(255,255,255,0.4)', maxWidth: '280px', fontSize: '0.85rem', lineHeight: '1.6' }}>
//             Redefining luxury through curated plotted developments. 
//             A legacy built on trust and architectural excellence.
//           </p>
//           <div className="social-links" style={{ marginTop: '1.5rem', display: 'flex', gap: '1.2rem' }}>
//             <a href="#"><Facebook size={18} /></a>
//             <a href="#"><Twitter size={18} /></a>
//             <a href="#"><Instagram size={18} /></a>
//             <a href="#"><Youtube size={18} /></a>
//           </div>
//         </div>

//         <div className="footer-links" style={{ display: 'flex', flexDirection: 'column', gap: '1rem' }}>
//           <h4 className="serif">Quick Links</h4>
//           <ul>
//             <li><button onClick={() => onNavigate('plots')} style={{ background: 'none', border: 'none', color: 'inherit', font: 'inherit', cursor: 'pointer', padding: 0 }}>Plots</button></li>
//             <li><button onClick={() => onNavigate('locations')} style={{ background: 'none', border: 'none', color: 'inherit', font: 'inherit', cursor: 'pointer', padding: 0 }}>Locations</button></li>
//             <li><button onClick={() => onNavigate('projects')} style={{ background: 'none', border: 'none', color: 'inherit', font: 'inherit', cursor: 'pointer', padding: 0 }}>Projects</button></li>
//             <li><button onClick={() => onNavigate('amenities')} style={{ background: 'none', border: 'none', color: 'inherit', font: 'inherit', cursor: 'pointer', padding: 0 }}>Amenities</button></li>
//           </ul>
//         </div>

//         <div className="footer-links" style={{ display: 'flex', flexDirection: 'column', gap: '1rem' }}>
//           <h4 className="serif">Company</h4>
//           <ul>
//             <li><button onClick={() => onNavigate('about')} style={{ background: 'none', border: 'none', color: 'inherit', font: 'inherit', cursor: 'pointer', padding: 0 }}>Our Vision</button></li>
//             <li><button onClick={() => onNavigate('about')} style={{ background: 'none', border: 'none', color: 'inherit', font: 'inherit', cursor: 'pointer', padding: 0 }}>Success Stories</button></li>
//             <li><button onClick={() => onNavigate('contact')} style={{ background: 'none', border: 'none', color: 'inherit', font: 'inherit', cursor: 'pointer', padding: 0 }}>Contact Us</button></li>
//             <li><button onClick={() => onNavigate('book-visit')} style={{ background: 'none', border: 'none', color: 'inherit', font: 'inherit', cursor: 'pointer', padding: 0 }}>Book Visit</button></li>
//           </ul>
//         </div>
//       </div>

//       <div className="footer-bottom" style={{ borderTop: '1px solid rgba(255,255,255,0.05)', padding: '2rem 0', marginTop: '3rem' }}>
//         <div className="container bottom-inner" style={{ display: 'flex', justifyContent: 'space-between', opacity: 0.5, fontSize: '0.75rem', letterSpacing: '1px' }}>
//           <p>© 2024 RSV GROUPS. ALL RIGHTS RESERVED.</p>
//           <p>PRIVACY POLICY | TERMS OF SERVICE</p>
//         </div>
//       </div>
//     </footer>
//   );
// };

// export default Footer;





import React from 'react';
import { Facebook, Twitter, Instagram, Youtube } from 'lucide-react';
import logo from '../images/LOGO.png';

const Footer = ({ onNavigate }) => {
  return (
    <footer className="footer">
      <div className="container">
        {/* Main Footer Content - 3 Columns */}
        <div style={{ 
          display: 'grid', 
          gridTemplateColumns: 'repeat(auto-fit, minmax(250px, 1fr))', 
          gap: '3rem',
          padding: '0',
          alignItems: 'start'
        }}>
          {/* Column 1 - Brand */}
          <div>
            <div onClick={() => onNavigate('home')} style={{ cursor: 'pointer', marginBottom: '1.5rem' }}>
              <img src={logo} alt="RSV Groups Logo" style={{ width: '140px', height: 'auto' }} />
            </div>
            <p style={{ 
              color: 'rgba(255,255,255,0.5)', 
              fontSize: '0.85rem', 
              lineHeight: '1.6', 
              marginBottom: '1.5rem',
              maxWidth: '280px'
            }}>
              Redefining luxury through curated plotted developments. 
              A legacy built on trust and architectural excellence.
            </p>
            <div style={{ display: 'flex', gap: '1rem' }}>
              <a href="#" style={{ color: 'rgba(255,255,255,0.5)', transition: 'color 0.3s' }}><Facebook size={18} /></a>
              <a href="#" style={{ color: 'rgba(255,255,255,0.5)', transition: 'color 0.3s' }}><Twitter size={18} /></a>
              <a href="#" style={{ color: 'rgba(255,255,255,0.5)', transition: 'color 0.3s' }}><Instagram size={18} /></a>
              <a href="#" style={{ color: 'rgba(255,255,255,0.5)', transition: 'color 0.3s' }}><Youtube size={18} /></a>
            </div>
          </div>

          {/* Column 2 - Quick Links */}
          <div>
            <h4 style={{ 
              fontSize: '1.1rem', 
              marginBottom: '1.5rem', 
              fontWeight: '500',
              letterSpacing: '1px',
              marginTop: 0
            }}>
              Quick Links
            </h4>
            <ul style={{ listStyle: 'none', padding: 0, margin: 0 }}>
              {['plots', 'locations', 'projects', 'amenities'].map((item) => (
                <li key={item} style={{ marginBottom: '0.75rem' }}>
                  <button 
                    onClick={() => onNavigate(item)} 
                    style={{ 
                      background: 'none', 
                      border: 'none', 
                      color: 'rgba(255,255,255,0.5)', 
                      cursor: 'pointer', 
                      padding: 0,
                      fontSize: '0.9rem',
                      transition: 'color 0.3s'
                    }}
                  >
                    {item.charAt(0).toUpperCase() + item.slice(1)}
                  </button>
                </li>
              ))}
            </ul>
          </div>

          {/* Column 3 - Company */}
          <div>
            <h4 style={{ 
              fontSize: '1.1rem', 
              marginBottom: '1.5rem', 
              fontWeight: '500',
              letterSpacing: '1px',
              marginTop: 0
            }}>
              Company
            </h4>
            <ul style={{ listStyle: 'none', padding: 0, margin: 0 }}>
              <li style={{ marginBottom: '0.75rem' }}>
                <button onClick={() => onNavigate('about')} style={{ background: 'none', border: 'none', color: 'rgba(255,255,255,0.5)', cursor: 'pointer', padding: 0, fontSize: '0.9rem', transition: 'color 0.3s' }}>Our Vision</button>
              </li>
              <li style={{ marginBottom: '0.75rem' }}>
                <button onClick={() => onNavigate('about')} style={{ background: 'none', border: 'none', color: 'rgba(255,255,255,0.5)', cursor: 'pointer', padding: 0, fontSize: '0.9rem', transition: 'color 0.3s' }}>Success Stories</button>
              </li>
              <li style={{ marginBottom: '0.75rem' }}>
                <button onClick={() => onNavigate('contact')} style={{ background: 'none', border: 'none', color: 'rgba(255,255,255,0.5)', cursor: 'pointer', padding: 0, fontSize: '0.9rem', transition: 'color 0.3s' }}>Contact Us</button>
              </li>
              <li style={{ marginBottom: '0.75rem' }}>
                <button onClick={() => onNavigate('book-visit')} style={{ background: 'none', border: 'none', color: 'rgba(255,255,255,0.5)', cursor: 'pointer', padding: 0, fontSize: '0.9rem', transition: 'color 0.3s' }}>Book Visit</button>
              </li>
            </ul>
          </div>
        </div>

        {/* Bottom Bar - No top/bottom space */}
        <div style={{ 
          borderTop: '1px solid rgba(255,255,255,0.1)', 
          padding: '1rem 0',
          marginTop: '0',
          display: 'flex',
          justifyContent: 'space-between',
          flexWrap: 'wrap',
          gap: '1rem',
          opacity: 0.5,
          fontSize: '0.75rem',
          letterSpacing: '0.5px'
        }}>
          <p style={{ margin: 0 }}>© 2024 RSV GROUPS. ALL RIGHTS RESERVED.</p>
          <p style={{ margin: 0 }}>PRIVACY POLICY | TERMS OF SERVICE</p>
        </div>
      </div>
    </footer>
  );
};

export default Footer;